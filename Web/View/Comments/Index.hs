module Web.View.Comments.Index where
import Web.View.Prelude

data IndexView = IndexView { comments :: [Comment] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={CommentsAction}>Comments</a></li>
            </ol>
        </nav>
        <h1>Comments</h1>
        <table class="table table-responsive">
            <thead>
                <tr>
                    <th>Comment</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>{forM_ comments renderComment}</tbody>
        </table>
    |]


renderComment comment = [hsx|
    <tr>
        <td>{comment}</td>
        <td><a href={ShowCommentAction comment.id}>Show</a></td>
        <td><a href={EditCommentAction comment.id} class="text-muted">edit</a></td>
        <td><a href={DeleteCommentAction comment.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
