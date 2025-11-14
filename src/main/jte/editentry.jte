@param com.example.cs3220aiwebapplication.JournalEntry entry
@param String username

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Entry</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container">
    <div class="card mx-auto mt-5" style="max-width:700px;">
        <div class="card-body">
            <h3>Edit Entry</h3>

            <form method="post" action="${"/entries/" + entry.getId() + "/edit"}">
                <div class="mb-2">
                    <label class="form-label">Title</label>
                    <input name="title" value="${entry.getTitle()}" class="form-control">
                </div>

                <div class="mb-2">
                    <label class="form-label">Mood</label>
                    <input name="mood" value="${entry.getMood() != null ? entry.getMood() : ""}" class="form-control">
                </div>

                <div class="mb-2">
                    <label class="form-label">Content</label>
                    <textarea name="content" rows="6" class="form-control">${entry.getContent()}</textarea>
                </div>

                <button class="btn btn-success">Save</button>
                <a href="${"/entries/" + entry.getId()}" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
