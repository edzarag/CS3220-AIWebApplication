@param java.util.List<com.example.cs3220aiwebapplication.JournalEntry> entries
@param String username

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Journal Entries</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container py-5">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>Your Journal Entries</h3>

        <div>
            @if(username != null && !username.isEmpty())
                <span class="me-2 small text-muted">Signed in as <strong>${username}</strong></span>
                <a class="btn btn-outline-secondary btn-sm" href="/logout">Logout</a>
            @endif

            <a class="btn btn-success ms-2" href="/entries/new">New Entry</a>
        </div>
    </div>

    @if(entries == null || entries.isEmpty())
        <p class="text-muted">No entries found.</p>
    @endif

    @for(com.example.cs3220aiwebapplication.JournalEntry e : entries)
        <div class="card mb-3">
            <div class="card-body">

                <h5 class="card-title">${e.getTitle()}</h5>

                <h6 class="card-subtitle mb-2 text-muted">
                    ${e.getCreatedAt().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"))}
                </h6>

                <p class="card-text">
                    ${
                        e.getContent() != null && e.getContent().length() > 120
                        ? e.getContent().substring(0, 120) + "..."
                        : (e.getContent() != null ? e.getContent() : "")
                    }
                </p>

                <!-- Action Buttons -->
                <a href="${"/entries/" + e.getId()}" class="btn btn-secondary btn-sm">View</a>
                <a href="${"/entries/" + e.getId() + "/edit"}" class="btn btn-primary btn-sm">Edit</a>

                <form method="post" action="${"/entries/" + e.getId() + "/delete"}" class="d-inline">
                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                </form>

            </div>
        </div>
    @endfor

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
