@param String username

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="text-center">
        <h2 class="mb-3">Welcome to AI Wellness Journal</h2>

        @if(username != null && !username.isEmpty())
            <p>Signed in as <strong>${username}</strong></p>
            <a class="btn btn-primary" href="/dashboard">Go to Dashboard</a>
            <a class="btn btn-outline-secondary ms-2" href="/logout">Logout</a>
        @else
            <a class="btn btn-success" href="/login">Login</a>
            <a class="btn btn-outline-primary ms-2" href="/register">Register</a>
        @endif
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
