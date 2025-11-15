@param java.util.List<com.example.cs3220aiwebapplication.model.JournalEntry> entries

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Entries</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/styling.css">
</head>
<body>

<nav class="navbar navbar-dark bg-dark px-3">
    <a class="navbar-brand" href="/dashboard">AI Wellness Journal</a>
    <div>
        <a href="/entries/new" class="btn btn-success me-2">New Entry</a>
        <a href="/logout" class="btn btn-danger">Logout</a>
    </div>
</nav>

<div class="container mt-4">
    <h2>Your Journal Entries</h2>

    @if(entries.isEmpty())
        <p>You have no entries yet. <a href="/entries/new">Add one</a>.</p>
    @else

        <table class="table table-striped mt-3">
            <thead>
            <tr>
                <th>Date</th>
                <th>Mood</th>
                <th>AI Mood</th>
                <th>Text</th>
                <th></th>
            </tr>
            </thead>

            <tbody>
            @for(com.example.cs3220aiwebapplication.model.JournalEntry entry : entries)
                <tr>
                    <td>${entry.getDate().toString()}</td>
                    <td>${entry.getMood()}</td>
                    <td>${entry.getAiMood()}</td>
                    <td>${entry.getText()}</td>
                    <td>
                        <a href="/entries/${entry.getId()}" class="btn btn-sm btn-primary">View</a>
                        <a href="/entries/${entry.getId()}/edit" class="btn btn-sm btn-warning">Edit</a>
                        <a href="/entries/${entry.getId()}/delete" class="btn btn-sm btn-danger">Delete</a>
                    </td>
                </tr>
            @endfor
            </tbody>
        </table>

    @endif
</div>

</body>
</html>