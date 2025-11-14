@param com.example.cs3220aiwebapplication.JournalEntry entry
@param String username

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${entry.getTitle()}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container py-5">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>${entry.getTitle()}</h3>

        <div>
            @if(username != null && !username.isEmpty())
                <span class="me-2 small text-muted">Signed in as <strong>${username}</strong></span>
                <a class="btn btn-outline-secondary btn-sm" href="/logout">Logout</a>
            @endif
            <a class="btn btn-success ms-2" href="/entries/new">New Entry</a>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <h4 class="card-title">${entry.getTitle()}</h4>

            <h6 class="card-subtitle mb-3 text-muted">
                ${entry.getCreatedAt().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"))}
                — Mood: ${ entry.getMood() != null ? entry.getMood() : "—" }
            </h6>

            <p class="card-text" style="white-space: pre-line;">
                ${entry.getContent()}
            </p>

            <a href="/entries" class="btn btn-secondary mt-3">Back</a>
            <a href="${"/entries/" + entry.getId() + "/edit"}" class="btn btn-primary mt-3">Edit</a>

            <form method="post" action="${"/entries/" + entry.getId() + "/delete"}" class="d-inline">
                <button type="submit" class="btn btn-danger mt-3">Delete</button>
            </form>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
