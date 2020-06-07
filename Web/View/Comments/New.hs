module Web.View.Comments.New where
import Web.View.Prelude

data NewView = NewView
    { comment :: NewComment
    , post :: Post
    }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CommentsAction}>Comments</a></li>
                <li class="breadcrumb-item active">Edit Comment</li>
            </ol>
        </nav>
        <h1>New Comment for <q>{get #title post}</q></h1>
        {renderForm comment}
    |]

renderForm :: NewComment -> Html
renderForm comment = formFor comment [hsx|
    {hiddenField #postId}
    {textField #author}
    {textField #body}
    {submitButton}
|]
