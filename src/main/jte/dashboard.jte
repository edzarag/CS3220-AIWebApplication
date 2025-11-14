@param String username

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="text-center mt-5">
    <h2 class="fw-bold">Dashboard</h2>
    <p>Welcome back, ${username}</p>

    <a class="btn btn-primary" href="/entries">View your journal entries</a>
    <a class="btn btn-outline-secondary ms-2" href="/logout">Logout</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
