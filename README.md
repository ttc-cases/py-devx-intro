# Python DevX intro

**Python - The Swiss army knife in development - all hacker's 1<sup>st</sup> choice. But that doesn't nessesarily mean that Python code should be a hack or bad structured**

A modern and professional approach to development naturally include concepts such as _objects_, _modules_, _unit tests_, _DX - Developer Experience_, _debuggers_, _declarative pipelines_, _git_ and _branching strategies_, _Configuration as Code_, _Infrastructure as Code_, _prompt engineering_, _agile process_, _DevOps culture_. The list of contemporary buzzes is endless. This tutorial aims to demonstrate how much of all this, you can actually get with as little effort as possible.

So what are the problems that this tutorial tries to offer a soultion to? Imagine the following scenario:

> A team of developers is working on a system in Python. Everyone is developing on their own PC which they have setup according to information on a project wiki - which isn't updated since long, so to get up and running in the team, new team members also need to have a couple of sit-down sessions with one of the senior team members, who seems to know stuff that isn't really documented anywhere. The members in the team often experience that somthing works on one colleague's PC while the same thing apparently doesn't work on someone else's PC. At one point a team member joined who had a preference to work on a MacBook _"...in your dreams!"_ that didn't work at all, now everyone is on Windows.
>
> The team uses git and GitHub, but there is no agreed branching strategy and as we speak the `main` branch is so far behind the `fix-database-screwup` branch which in reality has become the _de facto_ integration branch which everyone is refering to. The team has a joint trauma, that branching off only seem to create troubles and merge conflicts when coming back, so most team members work directly on `fix-database-screwup` but merge conflicts hasn't been less frequent on that account.
> >
> The team has a workflow setup in GitHub Actions, but it doesn't do much - it doesn't even build, since Python is interpreted and not complied - and the project doesn't have any unit tests yet. The job may not even be running. Nobody looked at it for months.
>
> The typical approach to debugging of the code is to print out a variable's value to the console. In fact there is a lot of code in the codebaase that is commented out - either because it's debug statments not needed anymore or it's code that is not used, but left behind as history or for potential future reuse. Who knows.
> 
> Releases are done by one of two team members who are the only ones who have access to the production servers. Exactly what they do when they upgrade the system is a bit blury. They may have some step-by-step notes in a Google document, they share just among the two of them. Which is probably OK, since it also hold some passwords and web tokens.
>
> The team uses a Miro board to keep track of their tasks and backlog, the agreement is that commit mesages should refer to the task in miro by mentioning the title on the miro notes, but it's so-so with that discipline. Roughly half of all commit messageas are - well - _meaningless_. And by the way, there are probably more task written directly in the codebase as in-line comments stating with `#TODO:` so searching for exactly thagt phrase in the codebase often gives more meaning than looking in the Miro board.
>
> Due to the general habit that everyone is developing on the same branch the team will freeze the branch - often for or as long as a week - up to a planned release. During the freeze nothing must enter the branch, except stuff that is specifically asked for and monitored by one of the two release guys. During this freeze of the integration branch, the test environemnt is also forzen and it becomes more of a _stage_ or _pre-production_ environment - and the test enviornment is then _cancelled_. Team members hold their code back either on branches or as dirty files in their VS Code environment. The last three release has come from the `fix-database-screwup` branch and not `main`.
>
> After a freze - the team has a day or two with mostly merge conflicts.

Well, There seems to be a long array of bad habits in this team's processes. Hopefully your team doesn't suffer from all af these. But maybe some? 

This littel anekcdote was just meant to set the scene. We will not revisit these problems again but instead focus on how to setup a green-field environment, and how to work in a way where they can easily be avoided. Fixing _all_ of these issues are really to be considered low-hanging fruits. 

This tutorial will offer you a handful of issues in GitHub. By following these issues you will - step-by-step - build up a small codebase and in the processe familiarize youself with:
> [!TIP]
> - **Declatively define a devcontainer** and configure the extensions used in VS Code - This will ensure that all contributors has idetical offset conditions before they start hacking (IDP = Internal Developemt Platform).
> - **Declatively define and spinup a virtual Python environment** inside that devcontainer - to ensure that no implicit or hidden settings could ever interfere with runtime environment. 
> - **Setup the Python debugger**, configure it to your specific needs and save and share the declarative settings for all other team members to use.
> - **Create a unit test and set up the unit test framework** to serve your specific needs and save and share the settings for all other team members to use. 
> - **Take the first step into deconstructing you codebase** into individually manageable modules and classes and deal with the internal dependencies this strategies imposes.
> - **Create development branches** for each individual task you work on.
> - **Tie commits to tasks** through clever mentions of issue numbers in the commit messages.
> - **Quite a few git tips and tricks** that will just make your life easier - maybe not in general, but your software development life at least.

When you are done with this tutorial you will have created something that can easily serve as a template setup for all your previous and future python projects. _Everything_ you'll ever need to use the _same_ setup and features in a _different_ context will be saved in declarative configuration files, which you can simply copy over to your existing projects and they will instantly benefit from your learnings.

When the instructional part of this tutorial is done, you will have the option to enter into the _Problem Solving_ chapter. Should you accept the challenge, you will be given a handful of complementary issues but these are not set up as instructions, but rather they present som relevant problems and challenges - andd you are then encouraged to suggest some solutions to these. And commit them to the repo

[^notghclassroom]: If you _didn't_ get here from a GitHub Classroom assignment you are truly ingenious and curious. But to participate you must enter from the [GitHub Classroom assignment](https://classroom.github.com/a/J7SqZWtl) - Go there and accept the assignment — and you will end up here again, only in a different setting.

During this exercise you will have your own GitHub repository. It's private, so only you and we can see your replies and reflections. You will _not_ be asked to write code or build anything. In this exercise we only use the GitHub Issues in your repo to get your replies an reflections. And if you choose you can even engage with us in the process — more on how to do that later.

If - by the end of this exercise - you still find that becoming a member of our team is attractive and relevant then the very last assignment is simply to use the link we provide in the end to book us for a video meeting (...or maybe you have booed it already) where we can go over your replies and reflections and get to know each other a bit.

## How to do this exercise[^notghclassroom]

**👉 Your first task is to create an issue... 👈**

When you hit the button "New issue" you'll be presented to a few different options. Use the [**A bit about you**](../../issues/new?template=background.yml) template. The issue you create will present you to a small form — use your full name as the issue title. 


#### 👉 Work those issues 👈

<img width="100" align="left" alt="image" src="https://user-images.githubusercontent.com/155492/219313640-1328aefb-7695-41d2-bbef-5c5ffe6ab079.png">Immediately after you submit your first issues an automated GitHub Actions workflow starts - it copies some template issues over to your own repo - It may take 15-20 seconds to finish - You can monitor it in the [`Actions`](../../actions) tab. When the job is finished and the issues are copied over, you are good to go.

Continue there, work those [issues](../../issues)

#### 👉 One (or more) commits per issues 👈
Please work the issues in such a way, that you deliver at least one - or potentially more - commits per issue, be sure to mention the isssue in the commit message. 

>[!CAUTION]
>Restrain youself from comitting stuff,
>that spans more than one issue.
>
>  👍 More than one commit per issue<br/>
>  👎 More than one issue per commit

#### 👉 Note to self 👈

Make it a habit do write plenty of notes in the comments of each issue. Utilize your MarkDown skills and write beautiful documentation. Think of it as _a note to self;_ Imagine you come back and read this repo 6 months out in the future, you want to be able to to follow you own lead and chain of though to the solutions. And so does your (imaginary) team mates.

#### 👉 If you need help 👈

At any time, if you need help, you have options:

1. Feel free to mention me [@lakruzz](https://github.com/lakruzz) in any of your issues.
2. Chat me up on LinkedIn (also) [@lakruzz](https://www.linkedin.com/in/lakruzz/).
3. Join the [public discussions in "The Tech Collective - Case Library"](https://github.com/orgs/ttc-cases/discussions/categories/-tech-that-chat)

