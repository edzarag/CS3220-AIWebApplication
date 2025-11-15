@param String fullName
@param double averageMood

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - AI Wellness Journal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/styling.css">
</head>
<body>

<nav class="navbar navbar-dark bg-dark px-3">
    <a class="navbar-brand" href="/dashboard">AI Wellness Journal</a>
    <div>
        <a href="/entries" class="btn btn-outline-light me-2">Entries</a>
        <a href="/mood-insights" class="btn btn-outline-light me-2">Insights</a>
        <a href="/logout" class="btn btn-danger">Logout</a>
    </div>
</nav>

<div class="container mt-4">
    <h2 class="mb-3">Welcome back, ${fullName}!</h2>

    <p>Your average mood: <strong>${averageMood}</strong></p>

    <div class="mt-4">
        <a href="/entries/new" class="btn btn-success me-2">New Entry</a>
        <a href="/entries" class="btn btn-primary me-2">View Your Entries</a>
        <a href="/mood-insights" class="btn btn-secondary">Mood Insights</a>
    </div>
</div>

</body>
</html>