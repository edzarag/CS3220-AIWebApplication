@param String error

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - AI Wellness Journal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/styling.css">
</head>
<body>

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4 shadow" style="max-width: 400px; width: 100%;">
        <h2 class="text-center mb-4">Login</h2>

        @if(error != null) {
        <div class="alert alert-danger">${error}</div>
        }@endif

        <form action="/login" method="post">
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input name="username" type="text" class="form-control"/>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input name="password" type="password" class="form-control"/>
            </div>

            <button class="btn btn-primary w-100" type="submit">Login</button>
        </form>

        <p class="text-center mt-3">
            Don’t have an account? <a href="/register">Register</a>
        </p>
    </div>
</div>

</body>
</html>
