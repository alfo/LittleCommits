# LittleCommits

This is Little Commits, a push publication for the Little Printer. It has been updated from [this version](https://github.com/alfo/little-cpmmits-dpc) which uses the old Direct Print API, which is more suited to other uses.

## Functionality

As I can't see an easy way to use both the push API and the `external_config` option, the one user config option is an email address. The subscription is created in the application when the user submits a valid email. An email is then sent to the user with their WebHook URL for use with GitHub. When a user unsubscribes, the app subscription is automatically deleted the next time a delivery would have been made.

## Heroku Config

There are a number of sensitive pieces of information used in this project - BERGCloud API keys and email account details. They are stored in Heroku's config variables, and accessed like so: `ENV['ACCESS_TOKEN']` etc. The following are required for you to have a working local version:

* `CONSUMER_TOKEN`, `CONSUMER_SECRET`, `ACCESS_TOKEN`, `ACCESS_TOKEN_SECRET`, all from your publication's development page
* `EMAIL_ADDRESS` and `EMAIL_PASSWORD` - GMail login credentials

## Contributing

Please feel free to contribute by forking and pull requesting - I haven't even been able to test this on a real Little Printer yet. I've deliberately included the Icon.psd so people can make suggestions for a better icon.