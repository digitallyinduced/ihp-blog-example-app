module Web.View.Posts.Show where
import Web.View.Prelude
import qualified Text.MMark as MMark

data ShowView = ShowView { post :: Include "comments" Post }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PostsAction}>Posts</a></li>
                <li class="breadcrumb-item active">Show Post</li>
            </ol>
        </nav>
        <h1>{post.title}</h1>
        <p>{post.createdAt |> timeAgo}</p>
        <div>{post.body |> renderMarkdown}.</div>
        <a href={NewCommentAction post.id}>Add Comment</a>
        <div>{forEach post.comments renderComment}</div>
    |]

renderComment comment = [hsx|
        <div class="mt-4">
            <h5>{comment.author}</h5>
            <p>{comment.body}</p>
        </div>
    |]

renderMarkdown text =
    case text |> MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml
