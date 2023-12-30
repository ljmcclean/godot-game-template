## How to Contribute *(using Git)*

> If you are interested in working on the project consistently or would like to 
talk with other project contributors, please contact me on Discord and I will
add you to a private channel with other contributors and I.


### ==Guidelines for Proposed Contributions==
___
- Changes/Additions should contribute to the projects goal of being **accessible**, **modular**,
and **well-documented**.
- The functionality of the change is important but it is more important that a user
can **learn from**, **understand**, and **customize** all additions to the project.
- Make sure the contribution follows
[best practices](https://github.com/LucksDev/godot_game_template/blob/main/_docs/best_practices.md)
for this project. That means that it should adhere to the **file structure**, use **static typing**, and
**explicit return types**.

### Contact Me

___
- This step is not necessary, but if you would like to make sure that your
proposed changes fall under the goals of this project, you may contact me
on Discord (see last section of [README](https://github.com/LucksDev/godot_game_template/blob/main/README.md)).


### Prepare Local Repo

___
1. [Fork](https://github.com/LucksDev/godot_game_template/fork) the repository.
2. Clone your version of the repository.
    - **Command**: `git clone URL_TO_YOUR_FORK`
3. Navigate to the repository.
    - **Command**: `cd NAME_OF_YOUR_REPO`
4. Verify that your fork is `origin`.
    - **Command**: `git remote -v`
5. If result is the word `origin` next to the URL of your fork continue to step 7.
6. Otherwise set the fork as `origin`
    - **Command**: `git remote add origin URL_OF_YOUR_FORK`
7. Go to your fork on GitHub and find the link called "forked from".
Click the link.
8. Find the "Clone or Download" button (it's green) and copy the HTTPS URL.
9. Set it as `upstream`.
    - **Command**: `git remote add upstream URL_OF_THIS_REPO`
10. Verify that your fork is `origin` and this repo is `upstream`.


### Get Started

___
1. Sync your fork with the repo.
    - **Command**: `git pull upstream main`
    > This is pulling the main repository and making sure your clone is up to date.
2. Create a separate branch for your changes.
    - **Command**: `git checkout -b BRANCH_NAME`
    > The branch name should describe what changes you're making. This command also
    switches your working directory to the new branch.
3. Start working on the changes you want to make.


### Managing Your Fork

___
1. Stage your changes.
    - **Command**: `git add -A`
2. Commit your changes.
    - **Command**: `git commit -m "YOUR_MESSAGE_HERE"`
    > This should be done often to make sure your work is not lost.
3. Push your changes.
    - **Command**: `git push origin YOUR_BRANCH_NAME`
    > This pushes the changes to your fork on GitHub.


### Opening A Pull Request

___
1. Open your fork in GitHub and find the highlighted area displaying your most recently pushed branch.
2. Find the button labeled "Compare & pull request" (it's green).
3. Press the button and complete the steps GitHub provides.
4. Review the pull request and ensure it is clear and accurate.
5. If you would like, or if it's requested, you may add commits to the fork.


### Updating Fork and Contacting Me

___
- After the fork has been proposed I may contact you via discussions in GitHub or through Discord
if that is your preference.
- You may continue to push commits to the fork after you have created the pull request if you 
would like to.
