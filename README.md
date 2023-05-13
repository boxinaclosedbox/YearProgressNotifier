YearProgressNotifier
===============

YearProgressNotifier, a simple script to update the percentage of year passed to give anxiety to all who look at it, written in Bash, for Telegram.

This Repo is highly inspired by [RedL0tus/YearProgressBot](https://github.com/RedL0tus/YearProgressBot), albeit it takes a completely different approach towards how the bot runs.

Deployment
----------

1. Fork the reposistory:

2. Set the following GitHub Actions secrets:
```
GIT_TOKEN : Your GitHub Account Token, To Generate One Head Over To "Settings"-->"Developer-Settings"-->"Personal-Access-Tokens"
TG_TOKEN : Your Telegram Bot Token, To Get This, Head Over To Telegram And Start A Chat With @BotFather, Then Follow On-Screen Steps
GIT_EMAIL : Preferably Your Private GitHub Email, Get It From "Settings/Emails"-->Under The "Keep My Email Addresses Private". GIT_EMAIL Could also be your normal email.
GIT_USERNAME : Preferably Your GitHub Username, Although It Could Be Anything
```
2. Fill the values in config.txt:
- Example of CHAT_IDS: `CHAT_IDS="-1001642062053 -1001199512844 -1001387925474"`
- Example of LENGTH: `LENGTH=20`

3. Make sure Actions are enabled in GitHub:
- To do this, visit the "Actions" tab of GitHub.
- If done right, your Notifier should begin sending Year Percentage messages every 3 days!

-------

Common Issues
----------

- You haven't added the Telegram Bot in your channel.
- config.txt isn't populated with correct syntax.
- Your GitHub Token expired. Make a token with no expiry.

-------

Features Nobody Asked For
----------

- Multiple Telegram Bots. For some unknown reason, you can add multiple Telegram Bot Tokens in the GitHub secret of `TG_TOKEN` and the message would be sent by all the Telegram Bots (as long as they're in the group(s)/channel(s)).
- The syntax follows: "$TOKEN1 $TOKEN2 $TOKEN3 ..."
Example: `TG_TOKEN` : `5070501422:AAFqmHTVuWQnEO7bhbvghubbbiufPIRX2-cY 7666262877:AaqILoveMisakaMikoto7ygsgbbsyyAhsysvs-zY 5072701422:AAVuWQnILoveAnimeNiufPIRX2-cz`

-------

Why does this Notifier exist?
----------

- This script exists with the sole purpose of reminding people (and inducing anxiety) of the passing year. In a futile attempt of hoping that another year doesn't fly by unnoticed.

-------

## **Warnings :**
- This Script uses GitHub Actions. Proceed with caution.
## **Credits :**
  * **RedL0tus** : [Github](https://github.com/RedL0tus/YearProgressBot)
