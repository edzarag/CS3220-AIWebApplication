@param java.util.List<com.example.cs3220aiwebapplication.model.JournalEntry> entries
@param double averageMood
@param String summary

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mood Insights</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/styling.css">
</head>
<body>

<nav class="navbar navbar-dark bg-dark px-3">
    <a class="navbar-brand" href="/dashboard">AI Wellness Journal</a>
    <div>
        <a href="/entries" class="btn btn-outline-light me-2">Entries</a>
        <a href="/logout" class="btn btn-danger">Logout</a>
    </div>
</nav>

<div class="container mt-4">
    <h2>Mood Insights</h2>

    <p><strong>Your average mood:</strong> ${averageMood}</p>

    @if(summary != null)
        <div class="alert alert-info mt-3">
            <strong>AI Summary:</strong><br>
            ${summary}
        </div>
    @endif

    <h4 class="mt-4">Entries Used for Analysis</h4>

    @if(entries.isEmpty())
        <p>No entries available.</p>
    @else
        <table class="table table-striped mt-3">
            <thead>
            <tr>
                <th>Date</th>
                <th>Your Mood</th>
                <th>AI Mood</th>
                <th>Text</th>
            </tr>
            </thead>

            <tbody>
            @for(com.example.cs3220aiwebapplication.model.JournalEntry entry : entries)
                <tr>
                    <td>${entry.getDate().toString()}</td>
                    <td>${entry.getMood()}</td>
                    <td>${entry.getAiMood()}</td>
                    <td>${entry.getText()}</td>
                </tr>
            @endfor
            </tbody>
        </table>
    @endif
</div>

</body>
</html>