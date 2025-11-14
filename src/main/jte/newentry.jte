@param com.example.cs3220aiwebapplication.JournalEntry entry
@param String username

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Entry</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container">
    <div class="card mx-auto mt-5" style="max-width:700px;">
        <div class="card-body">
            <h3>Create New Entry</h3>

            <form method="post" action="/entries/new">
                <div class="mb-2">
                    <label class="form-label">Title</label>
                    <input name="title" class="form-control">
                </div>

                <div class="mb-2">
                    <label class="form-label">Mood</label>
                    <input name="mood" class="form-control" placeholder="e.g. happy, anxious">
                </div>

                <div class="mb-2">
                    <label class="form-label">Content</label>
                    <textarea name="content" class="form-control" rows="6"></textarea>
                </div>

                <button class="btn btn-success">Save Entry</button>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
