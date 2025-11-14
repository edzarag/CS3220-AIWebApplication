@param String error
@param String username

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="row justify-content-center mt-5">
    <div class="col-md-5">
        <div class="card shadow-sm">
            <div class="card-body">
                <h3 class="mb-3">Login</h3>

                <form method="post" action="/login">
                    <div class="mb-2">
                        <label class="form-label">Username</label>
                        <input name="username" class="form-control" value="${username != null ? username : ""}">
                    </div>

                    <div class="mb-2">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control">
                    </div>

                    <button class="btn btn-success w-100">Login</button>
                </form>

                @if(error != null && !error.isEmpty())
                    <div class="alert alert-danger mt-3">${error}</div>
                @endif

                <p class="mt-3 small text-center">
                    Don't have an account? <a href="/register">Register here</a>
                </p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
