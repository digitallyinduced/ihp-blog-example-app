module Web.View.Comments.Edit where
import Web.View.Prelude

data EditView = EditView { comment :: Comment }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CommentsAction}>Comments</a></li>
                <li class="breadcrumb-item active">Edit Comment</li>
            </ol>
        </nav>
        <h1>Edit Comment</h1>
        {renderForm comment}
    |]

renderForm :: Comment -> Html
renderForm comment = formFor comment [hsx|
    {textField #postId}
    {textField #author}
    {textField #body}
    {submitButton}
|]
