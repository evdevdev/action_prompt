# Action Prompt

Action Prompt provides a dead simple way to way to organize and render prompts within a Rails App. This draws heavy inspiration from `ActionMailer::Preview`.

> [!IMPORTANT]
> This gem is a work-in-progress. **It is not production ready** . That said, `ActionPrompt` is under active development. Any and all feedback would be very welcome.

## Installation

Install the gem with `gem "action_prompt"`.

## Previewing Prompts

1. Create a template for a prompt. These go in your `app/prompts` folder. For example, you might create `app/prompts/hello_world.text.erb` and give it the following content:

   ```
   You are a helpful assistant who replies with, "<%= @message >"
   ```

2. Create a preview class. These live in `test/prompts` and they inherit from `ActionPrompt::Preview`. For example, you might create `tests/prompts/hello_world_preview.rb` and give it the following context:

   ```ruby
   class HelloWorldPreview < ActionPrompt::Preview
    def example_prompt
      render "hello_world", locals: {message: "Hello, world!"}
    end
   end
   ```

3. Next, start up your rails server (`rails s`) and navigate to [http://localhost:3000/action_prompt/previews](http://localhost:3000/action_prompt/previews). You'll see a list of your prompts that resembles the following:

   _image goes here_

   You can now preview your prompts.

## Rendering prompts within your app

1. Assume you've followed step one above, and you have a prompt located at `app/prompts/hello_world.text.erb`.
1. You can now render this anywhere in your codebase with the following:

   ```ruby
   ActionPrompt::Renderer.new.render("hello_world", locals: {message: "Now we're cooking"})
   # You are a helpful assistant who replies with, "Now we're cooking"
   ```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
