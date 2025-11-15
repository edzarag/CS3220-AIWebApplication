@param com.example.cs3220aiwebapplication.model.JournalEntry entry

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Entry</title>
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
    <h2>Delete Entry</h2>

    <p>Are you sure you want to delete the entry from
        <strong>${entry.getDate().toString()}</strong>?</p>

    <blockquote>${entry.getText()}</blockquote>

    <form action="/entries/${entry.getId()}/delete" method="post">
        <button class="btn btn-danger" type="submit">Delete</button>
        <a href="/entries" class="btn btn-secondary ms-2">Cancel</a>
    </form>
</div>

</body>
</html>