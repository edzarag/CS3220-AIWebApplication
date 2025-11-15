<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Entry</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/styling.css">
</head>
<body>

<nav class="navbar navbar-dark bg-dark px-3">
    <a class="navbar-brand" href="/dashboard">AI Wellness Journal</a>
    <div>
        <a href="/entries" class="btn btn-outline-light">Back</a>
        <a href="/logout" class="btn btn-danger ms-2">Logout</a>
    </div>
</nav>

<div class="container mt-4">
    <h2>New Journal Entry</h2>

    <form action="/entries/new" method="post">
        <div class="mb-3">
            <label class="form-label">Your thoughts</label>
            <textarea name="text" class="form-control" rows="5"></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Mood (1–10)</label>
            <input name="mood" type="number" min="1" max="10" class="form-control"/>
        </div>

        <button class="btn btn-success" type="submit">Save Entry</button>
    </form>

    <p class="text-muted mt-3">AI analysis will appear after saving.</p>
</div>

</body>
</html>