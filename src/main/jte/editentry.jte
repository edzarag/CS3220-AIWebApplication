@param com.example.cs3220aiwebapplication.model.JournalEntry entry

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Entry</title>
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
    <h2>Edit Entry from ${entry.getDate().toString()}</h2>

    <form action="/entries/${entry.getId()}/edit" method="post">
        <div class="mb-3">
            <label class="form-label">Text</label>
            <textarea name="text" class="form-control" rows="5">${entry.getText()}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Mood (1–10)</label>
            <input name="mood"
                   type="number"
                   min="1"
                   max="10"
                   class="form-control"
                   value="${entry.getMood()}"/>
        </div>

        <button class="btn btn-primary" type="submit">Save Changes</button>
        <a href="/entries/${entry.getId()}" class="btn btn-secondary ms-2">Cancel</a>
    </form>
</div>

</body>
</html>