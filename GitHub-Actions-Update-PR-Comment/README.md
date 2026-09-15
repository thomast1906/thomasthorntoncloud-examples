## How to update a pull request comment from GitHub Actions instead of creating duplicates

Automated pull request comments are useful until every new commit creates another one.

A test summary, deployment preview, infrastructure plan or automated review normally represents the latest state of the branch. Posting another comment on every workflow run turns that state into a timeline, leaving reviewers to work out which result still matters.

I'd treat the comment as managed state instead:
1. Give it a stable identifier.
2. Find the existing comment.
3. Update it when it exists.
4. Create it only when it doesn't.

That gives the pull request one place for the current result.

[Blog post here](https://thomasthornton.cloud/how-to-update-a-pull-request-comment-from-github-actions-instead-of-creating-duplicates/)
