# Markov

Let's generate some text from Slack messages!

Make sure you have Ruby, Bundler, and Erlang installed (Elixir is not required since it is embedded in the `./markov` script).

1. Generate an API token at <https://api.slack.com/docs/oauth-test-tokens>
2. Pull down the repo and `cd` into it:

    ````
    git clone https://github.com/mxhold/markov_ex.git

    cd markov_ex
    ````

3. Install the Slack gem by doing `bundle install`
4. Run `./slack_to_text your_token your_username > my_slack_messages.txt` (this can take a few seconds)
5. Run `./markov my_slack_messages.txt 100` to generate 100 words

That's it!
