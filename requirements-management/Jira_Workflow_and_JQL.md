# Jira workflow and JQL practice

The personal Kanban space contains 3 Epics, 6 Stories and 3 Subtasks (12 work items). Statuses: To Do, In Progress, In Review, Done.

Snapshot: 8 To Do, 3 In Progress, 1 Done across the 12 work items. These statuses were moved for a workflow simulation; they are not evidence of developed alert logic or executed QA. The board view showed five To Do stories and one In Progress story.

## JQL examples practiced

```jql
project = KAN AND issuetype = Story
```

```jql
project = KAN AND priority = High AND statusCategory != Done
```

```jql
project = KAN AND assignee = currentUser() AND statusCategory != Done
```

```jql
project = KAN AND issuetype = Story AND status = "In Review"
```

The first query targets the six stories. The captured currentUser() query returned seven work items at the time of practice. Counts may differ if assignment or workflow changes. The exercise included linking subtasks using blocks / is blocked by and moving work through Kanban statuses.
