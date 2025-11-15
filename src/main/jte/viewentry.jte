@param com.example.cs3220aiwebapplication.model.JournalEntry entry

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Entry</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/styling.css">
</head>
<body>

<nav class="navbar navbar-dark bg-dark px-3">
    <a class="navbar-brand" href="/dashboard">AI Wellness Journal</a>
    <div>
        <a href="/entries" class="btn btn-outline-light me-2">Back</a>
        <a href="/logout" class="btn btn-danger">Logout</a>
    </div>
</nav>

<div class="container mt-4">
    <h2>Entry from ${entry.getDate().toString()}</h2>

    <p><strong>Your Mood:</strong> ${entry.getMood()}</p>

    <h4>Your Text:</h4>
    <p>${entry.getText()}</p>

    <hr>

    <h4>AI Analysis</h4>
    <p><strong>AI Mood:</strong> ${entry.getAiMood()}</p>
    <p><strong>AI Sentiment:</strong> ${entry.getAiSentiment()}</p>

    @if(entry.getAiTips() != null)
        <ul>
            @for(String tip : entry.getAiTips())
                <li>${tip}</li>
            @endfor
        </ul>
    @endif

    <div class="mt-3">
        <a href="/entries/${entry.getId()}/edit" class="btn btn-warning me-2">Edit</a>
        <a href="/entries/${entry.getId()}/delete" class="btn btn-danger">Delete</a>
    </div>
</div>

</body>
</html>