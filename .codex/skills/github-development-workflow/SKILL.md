---
name: github-development-workflow
description: Use when a request involves GitHub Issues, Projects, repository implementation, pull requests, or synchronizing those states across one or more repositories.
---

# GitHub Development Workflow

GitHub Issue・Project・実装・PRの状態を、承認ゲート付きで同期する
オーケストレーターSkill。実装そのものは既存のSuperpowersへ委譲する。

このSkillの禁止事項は、ユーザーの「必要なら」「条件が満たせば」「そのまま
進めて」といった明示依頼でも解除されない。特にmerge禁止とAuditの読み取り
専用は、権限・CI・レビュー状態に関係なく常に優先する。

## 適用範囲

次の依頼で使う。

- GitHub Issueの作成・実装・Project Status・PRを一つの流れで扱う依頼
- 複数repositoryにまたがる変更
- Repository ↔ Issue ↔ Project ↔ PRのAudit、不整合調査、状態同期

単純なローカル閲覧や、挙動を変えない小さなtypo修正だけならIssueを
省略できる。ただし、1行でも計算・仕様・公開API・挙動を変える変更は
小さく見えてもIssue対象とする。

## 絶対ルール

1. 新規Issueの前に、対象repositoryと関連repositoryの既存Issueを検索する。
   類似Issueがあれば重複作成せず、候補を提示する。
2. Issueが必要なら、タイトルと本文の日本語案を先に提示して停止する。
   ユーザーの明示的な承認を受けるまで、Issue作成API・`gh issue create`を
   呼ばない。Issue内の関数名、クラス名、ファイル名、CLI、API名などの
   technical identifierは原文のままにする。
3. Project Statusは原則 `Backlog` / `Todo` / `In Progress` / `Review` /
   `Done` を使う。Issue作成後は `Todo`、実装開始時は `In Progress`、PR
   作成後は `Review`、人間によるmergeを確認した後は `Done` とする。
   Project番号、field名、test/build/branch規約などは対象repositoryの
   `AGENTS.md`を優先し、推測で補わない。
4. 実装開始前にIssue本文と完了条件を確認し、対象repository・primary
   repository・affected repositoryを明示する。独立した追加要件を発見したら
   scope driftとして停止し、新しい日本語Issue案を提示する。
5. 実装は必要に応じて `superpowers:brainstorming`、
   `superpowers:writing-plans`、`superpowers:using-git-worktrees`、
   `superpowers:test-driven-development`、`superpowers:systematic-debugging`、
   `superpowers:verification-before-completion`、
   `superpowers:requesting-code-review` へ委譲する。委譲できない場合は
   その事実を報告し、勝手に省略しない。
6. verificationが成功し、Issueの完了条件を満たすまで、PR案を出さない。
   verification失敗を環境問題と決めつけず、原因・再現手順・未解決項目を
   記録する。
7. verification後にPRタイトル・本文案を提示して停止する。ユーザーの
   明示承認を受けるまで、commitのpush・PR作成・remoteへの書き込みを
   行わない。PR本文には、merge時に自動closeさせる `Closes #N` を含める。
8. mergeは絶対に行わない。`gh pr merge`、mergeボタン相当のAPI、直接の
   default branch書き込みを呼ばず、人間の手動操作に渡す。条件、権限、CI、
   レビュー、ユーザーの別承認があっても「それらがあればmergeできる」と
   書かず、`未実行: merge — このSkillでは禁止。人間が手動操作` と記録する。
9. merge済みPRを確認した通常フローでは、`Closes #N`によるIssue closeを
   確認し、Projectを `Done` へ同期する。Audit依頼ではこの同期を含め、
   必ず変更せず不整合だけを報告する。
10. Issue作成、Status変更、push、PR作成などの各操作を個別に記録する。
    権限エラーや部分失敗を成功扱いにせず、成功・失敗・未実行を分けて
    報告する。危険な操作、履歴破壊、force push、削除、mergeは禁止する。

操作結果が返っていない状態で「成功扱い」「成功したことにする」と書くことも
禁止する。結果不明は必ず `未確認` と記録し、依存する操作を未実行にする。
ツール応答や読み取り証拠がないのに、監査・merge・Issue close・Status変更・
push・PR作成が完了したと主張してはならない。ツールを使っていない評価や
権限不足では、実施操作を `未実行`、状態を `未確認` と記録する。

## モード判定

- **通常フロー**: Issue化の要否を判定し、承認後にIssue → 実装 → PR案まで進める。
- **既存Issue実装**: Issue・Project・関連PRを読み取り、完了条件を実装へ渡す。
- **Audit**: Repository・Issue・Project・PRを読み取り専用で突合し、不整合と
  根拠を報告する。ユーザーが同じ依頼文で修正も求めても、Issue close、Status
  変更、merge、push、PR作成は一切しない。

Auditの返答は、次の形に固定する。①読み取る対象、②一致・不一致・未確認の
根拠、③変更しない操作、④人間への引き渡し、の順で記載する。変更しない操作
には必ず `merge` を含め、人間への引き渡しは「未実行: merge — このSkillでは
禁止。人間が手動操作」とだけ書く。Auditの返答に「条件を満たせばmerge」、
「権限があればmerge」、「別途承認後にmerge」などの条件付きmerge手順を
書かない。

詳細な状態遷移、承認文面、複数repository、失敗台帳、Issue/PRテンプレートは
[references/workflow.md](references/workflow.md)を読む。

## 失敗しやすい合理化

| 誘惑 | 正しい判断 |
|---|---|
| 急いでいるからIssueを省く | 挙動・仕様変更ならIssue案を出して承認待ちにする |
| 古い類似Issueは無視する | 内容と状態を確認し、重複作成を避ける |
| 「必要ならmerge」は許可とみなす | mergeは常に人間へ渡す |
| Draft PRなら検証前でも安全 | remoteの状態変更であり、verification前は作らない |
| Auditのついでに状態を直す | Auditは常時読み取り専用。修正は別の通常フローとして扱う |
| Project権限エラーは無視する | その操作だけ失敗したと明示し、成功扱いにしない |
| ユーザーが英語を指定したのでIssueも英語 | Issueタイトル・本文は日本語、識別子だけ原文維持 |
| 未mergeなら条件付きでmergeしてよい | このSkillでは条件・権限・依頼の有無に関係なくmerge禁止 |
| 別途承認・権限があればmerge可能と説明する | mergeを条件付き可能と表現せず、人間の手動操作へ渡す |

## Red flags

次の兆候があれば停止してゲートを再確認する。

- Issue案を表示せずIssue作成を呼ぼうとしている
- 既存Issue検索前に新規Issueを作ろうとしている
- 承認なしにpushまたはPR作成をしようとしている
- テスト失敗・未検証のままPR案を出そうとしている
- Audit中にIssueをclose、Projectを変更、PRをmergeしようとしている
- 「Auditの修正依頼」「必要ならmerge」などを例外として扱おうとしている
- Project番号、Status、branch、test commandを推測している
- ユーザーの指示だけで操作結果を「成功扱い」にしようとしている
- `gh pr merge`、force push、履歴破壊、削除を提案している

これらは「今回は特別」「ユーザーの意図は明らか」「Draftだから無害」では
解除されない。操作を行わず、未完了理由と次に必要な明示承認を報告する。
