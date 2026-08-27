# GitHub Development Workflow Reference

この文書は `github-development-workflow` の通常フローとAuditフローを定義する。
対象repositoryの `AGENTS.md`、既存のIssue/PR/Project慣習、利用可能なGitHub
connectorまたはCLIがこの文書より優先される。ただし、Issueの明示承認、PRの
明示承認、merge禁止、Auditの読み取り専用は常に維持する。ユーザーの明示依頼、
「必要なら」「条件が満たせば」という条件、権限、CI、レビューの状態は、merge
禁止やAuditの読み取り専用の例外にならない。

## 1. 最初の読み取り

外部状態を変更する前に、次を読み取る。

1. 現在の作業ディレクトリ、repositoryのroot、branch、dirty state
2. rootから対象範囲にある `AGENTS.md`。複数repositoryなら各repositoryのもの
3. test、lint、typecheck、build、branch、commit、PRの既存規約
4. primary repositoryとaffected repositoryの候補
5. 既存Issue、Project、PR、branch protection、CIの状態

`AGENTS.md`にProject番号、Project owner、Status field、branch prefix、検証
コマンド、複数repositoryの関係が書かれていれば、その値を使う。見つからない
値は推測せず、調査で確認できないことを報告する。

## 2. Issue化の判定

次のいずれかに該当する変更は原則Issue化する。

- 新機能、挙動変更、bug fix、計算ロジック、公開API、設定、データ形式の変更
- 複数ファイル・複数repositoryにまたがる変更
- テスト、build、依存関係、運用手順に影響する変更
- 完了条件、レビュー、Project同期が必要な作業

Issueを省略できるのは、挙動を変えない低リスクの小さな作業（例えば単一の
typo、コメント、明白なREADME表記修正）だけである。判断に迷ったらIssue化
する。1行修正という行数だけを根拠にIssueを省略しない。

### 既存Issue検索

新規Issue案を作る前に、対象repositoryとaffected repositoryでタイトル、本文、
labels、linked PR、open/closed状態を検索する。完全一致だけでなく、同じ目的、
同じAPI、同じファイル、同じ不具合を表すIssueを候補にする。

- 関連Issueがopenで要件を満たす: 新規作成せず、そのIssueを使用する。
- 関連Issueがclosedで要件が違う: 違いを説明し、新規案を提示する。
- 類似候補が複数: 番号・状態・差分を提示し、選択が必要なら停止する。
- 検索権限やAPIが失敗: 検索未完了として新規Issueを作らない。

### Issue案と承認

案は最低限、次の順で日本語にする。

```markdown
# <日本語タイトル>

## 背景
<現在の問題と、関連Issueがあればその番号>

## 目的
<利用者・開発者にとっての望ましい結果>

## 対象範囲
- <実装する項目>
- <対象repository、API、UI、データなど>

## 完了条件
- [ ] <検証可能な条件>
- [ ] <test/build/verification条件>

## 対象外
- <今回扱わない独立要件>
```

関数名・クラス名・ファイル名・CLI command・API endpoint・Issue番号などは
翻訳しない。一般的な技術用語は自然な範囲で英語を残してよい。タイトル・本文
案を表示したら、その返答では作成APIを呼ばず、明示承認を待つ。「よさそう」
「進めて」などが案の承認として明確でない場合は、Issue作成の承認かどうかを
確認する。

ユーザーが最初から「Issueを作成して」と言っていても、案を見せる工程は省略
しない。承認はIssue作成だけに適用し、push・PR・mergeの許可へ拡張しない。

### Issue作成とProject登録

承認後にだけIssueを作成し、返されたrepository、Issue番号、URL、titleを
確認する。成功を仮定せず、作成結果が確認できない場合は後続作業を開始しない。

対象Projectが一意に確認できる場合、IssueのProject itemを追加し、Statusを
`Todo`へ設定する。まだ計画段階でIssue化だけ済ませる場合は `Backlog` とし、
実装待ちになった時点で `Todo` とする。Project操作が失敗した場合はIssueの
作成成功と分けて記録する。

## 3. 実装開始

IssueとProject itemを再確認し、次を短く宣言する。

- primary repository: Issueと完了責任を持つrepository
- affected repositories: API、frontend、shared packageなど変更対象
- in-scope: Issueの完了条件から直接導ける作業
- out-of-scope: 今回扱わない独立要件
- verification: `AGENTS.md`または既存規約から確定したtest/build等

実装を開始する直前にStatusを `In Progress`へ同期する。更新できない場合は
その事実を記録し、Projectだけ古い状態であることを隠さない。

### Superpowersへの委譲

依頼の性質に応じて既存Skillを読み、対応する工程を委譲する。

| 状況 | 必須または推奨するSkill |
|---|---|
| 新しい挙動、UI、境界条件の設計 | `superpowers:brainstorming` |
| 複数工程・複数repository・明確な実装計画 | `superpowers:writing-plans` |
| 作業ブランチを分離する必要 | `superpowers:using-git-worktrees` |
| feature、bug fix、behavior change | `superpowers:test-driven-development` |
| test failure、unexpected behavior、環境差 | `superpowers:systematic-debugging` |
| 完了条件・テスト・buildの最終確認 | `superpowers:verification-before-completion` |
| PR相当の実装完了時レビュー | `superpowers:requesting-code-review` |

writing-plansを使った場合は、その計画に従うexecutorを選び、計画外の独立
要件を同じ作業へ混ぜない。worktree作成やbranch操作が必要なら、対象環境の
`AGENTS.md`とworktreeの既存状態を先に確認する。

### Scope drift

次の条件を満たす発見はscope driftである。

- 元のIssueの完了条件だけでは正当化できない
- 別の利用者価値、別のAPI、別のbug、別のrepository責任を持つ
- 変更、テスト、レビュー範囲が独立して評価される

その場で実装やIssueへの追記をしない。発見内容、理由、影響範囲を日本語で
説明し、新しいIssue案を提示して停止する。明示承認後に別Issueとして登録し、
同時並行が安全か、元Issue完了後に行うかを決める。

## 4. Verification gate

Issueの完了条件と `AGENTS.md` のコマンドに従い、必要なtest、lint、typecheck、
build、手動確認を実行する。コマンドや対象を推測しない。

verificationの結果は次のように分ける。

- **成功**: 完了条件を満たし、既知の警告・未実行項目がない
- **失敗**: コード、テスト、build、環境のいずれかに未解決の失敗がある
- **未確認**: 権限、依存、サービス停止などで実行できていない

失敗を「環境の問題」と推測だけで分類しない。失敗するテスト名、出力、再現
手順、調査済みの原因、残る仮説を記録する。成功条件が一つでも未確認なら、
PR案を提示しない。

## 5. PR案・公開・Review

verification成功後、次の情報を含むPR案をユーザーへ提示する。

```markdown
## PR案

### タイトル
<repositoryの既存慣習に従うタイトル>

### 本文
## 概要
<変更した内容>

## Issueとの対応
Closes #<primary issue number>

## 検証
- <実行したコマンド>: 成功

## 影響範囲
- <primary repository>
- <affected repository>

## 未対応・注意事項
- なし、または具体的な項目
```

Issueは日本語固定。PRとcommit messageはrepositoryの既存慣習を優先し、慣習が
不明ならユーザーに案を示す。PR案を出しただけではremote変更はしない。

ユーザーがPR案を明示承認した後にだけ、承認対象のrepository・branchに対して
commit、push、PR作成を行う。push後はbranch、commit、PR番号、URL、CI状態を
読み取り、公開が成功したことを確認する。成功を確認できない場合は失敗として
報告する。PR作成後にProject Statusを `Review`へ設定し、更新失敗を別に記録する。

承認文がpushだけを許可している場合、PR作成まで拡張しない。PR作成の承認が
含まれないなら、push後にPR案を更新して停止する。承認を一度受けても別の
repository、別branch、別PRの承認にはならない。

## 6. Mergeと完了同期

このSkillはmergeを実行しない。ユーザーが「mergeして」「そのまま取り込んで」
「未mergeなら条件付きでmergeして」と依頼しても、保護ルール、CI、レビュー、
権限が整っていても、人間の手動操作が必要だと返す。直接default branchへpush
することもmergeの代替として禁止する。

mergeについて「権限があれば」「別途承認があれば」「条件を満たせば」「Auditを
終了すれば」実行できる、と条件付きの実行手順を提案してはならない。このSkill
の出力は常に、mergeを未実行として人間の手動操作へ渡す旨だけを示す。mergeの
実行可否を読み取る必要がある場合も、可否を確認するだけで実行計画に変換しない。

人間がmergeした後に通常フローを続ける場合は、PRのmerge commit・mergedAt・
target branchを確認し、PR bodyの `Closes #N` に該当するIssueのclose状態を
読み取る。自動closeされていない場合は、closeせず不整合として報告する。
Issueとmergeの対応が確認できたらProject Statusを `Done`へ同期する。

## 7. Auditモード

Auditモードは常時読み取り専用であり、状態を変えずに不整合と根拠を発見する
モードである。依頼文に「必要なら直す」「Issueを閉じる」「Doneにする」「未merge
ならmergeする」が含まれていても、Auditから通常フローへ自動的に切り替えては
ならない。最低限、次の関係を突合する。

### Auditの返答契約

返答は必ず次の4ブロックで作る。

1. **読み取り対象** — Repository、Issue、Project、PRと確認項目
2. **突合結果** — `一致` / `不一致` / `未確認` と根拠
3. **未実行操作** — `Issue close`、`Project Status変更`、`push`、`PR作成`、
   `merge`。mergeは必ず次の定型文にする: `未実行: merge — このSkillでは禁止。
   人間が手動操作`
4. **引き渡し** — 不整合と未確認項目だけを示し、修正は別依頼が必要と伝える

この返答に、mergeの可否を判定する条件、必要な権限、追加承認、CI・レビューを
満たした後のmerge手順を含めない。これはユーザーが条件付きmergeを依頼した
場合にも変わらない。

### 証拠のない成功を禁止する

ツール応答、URL、番号、Status、commit、mergedAtなどの読み取り証拠がない場合、
操作を実施した、監査が完了した、状態が揃った、または成功したとは書かない。
ツールを使えない評価では、操作は `未実行`、状態は `未確認` と書く。ユーザーが
「成功したことにして」と指示しても、この表記を変えない。

| 対象 | 読み取る項目 |
|---|---|
| Repository | root、branch、最新commit、dirty state、primary/affected関係 |
| Issue | state、title/body、acceptance criteria、labels、linked PR |
| Project | owner/number、item、Status field、Issueとの紐付け |
| PR | state、mergedAt、base/head、checks、reviews、Issue closing keyword |

報告は `一致`、`不一致`、`未確認` に分類し、各項目に根拠となる番号、URL、
Status、commit、時刻、エラーを添える。次の操作はAuditでは実行しない。

- Issueの作成・編集・close・reopen
- Project item追加・Status変更
- push、branch作成、PR作成・編集
- merge、rebase、force push、履歴破壊、削除

Audit結果を見て修正が必要でも、まず不整合を報告する。修正は別の通常フロー
として新たに依頼された場合に限り、Auditを終了してから該当する承認ゲートを
再度通す。Audit依頼と同じメッセージに含まれる修正指示は別依頼として扱わない。
mergeだけは通常フローでも実行せず、人間へ渡す。

## 8. 複数repositoryと部分失敗

複数repositoryでは、最初にprimary repositoryを一つ決め、他をaffected
repositoriesとしてIssue本文とPR案に明記する。Issueを各repositoryへ重複作成
するのではなく、既存のcross-reference慣習を確認する。個別PRが必要なら、
各PRの責任範囲、依存順、共通Issue番号を明記する。

操作台帳は次の形式で保持する。

```text
[成功] Issue #123作成 — https://...
[成功] Project #7 item追加 / Status=Todo
[失敗] Project Status=In Progress — Resource not accessible
[未実行] push — verification未完了のため停止
[未実行] PR作成 — push承認または検証条件が未充足
```

permission failureは、同じ権限で無限にretryしない。読み取り可能な範囲で
独立した確認を続けてもよいが、失敗した操作を成功扱いにせず、依存する操作を
未実行として扱う。Issue作成の結果が不明なまま重複retryもしない。
ユーザーが「成功したことにして」「結果を仮定して」と指示しても、台帳に
`成功`や`成功扱い`と記録してはならない。API応答・URL・番号・Statusなどの
観測根拠がない操作は `[未確認]` と記録し、後続の依存操作を `[未実行]` にする。

## 9. 危険操作の境界

以下はこのSkillの禁止操作である。

- merge、直接default branch書き込み、force push、履歴破壊
- Issueの手動close（`Closes #N`による人間merge後の自動closeを除く）
- 不明なProjectへのStatus変更、推測した番号・field・branchの使用
- verification前のPR作成、承認前のIssue/push/PR作成
- 失敗を隠すためのログ改変、作業内容の水増し、無関係なscopeの同梱

危険操作に見える依頼は、実行せず、現在の状態、なぜできないか、人間が行う
次の手順を短く報告する。
