# Big Co Studio 

## What do you need to do?

Add correct information and assets about your Studio project and your team (see instructions below). When uploading your assets, make sure that each team profile picture is only 100 x 100 px and your team photo is only 600 x 400 px. Uploading images above this size will slow down the entire GitHub site, so please be considerate and convert your images! 

For questions email Divyansh Lohia (dl972@cornell.edu), Sachi Angle (sva22@cornell.edu), and Tyler Rhorick (tr362@cornell.edu) 

## Why?
For Studio Spring 2020, we are asking you to use Github to keep track of your progress.

For this purpose, we have created one private Github repo for each team, under ct-studio-buildboard. The name of the repository corresponds to the studio and number of your team.

## What is the private repo for?
Feel free to use the repository as you see fit.

The repo is private: only your team and the Studio team have access to the content of the repository. Nobody else from Cornell Tech, nobody else from the outside.

## How do I provide data about my project?
For reporting, we ask you to create and update a special file called report.yaml inside this repository. We will use this file to automatically generate reports and a website for all projects .

The report.yaml file used the YAML file format (syntax definition, on-line syntax checker) and should following the structure defined below.

We also ask you to upload logos, individual pictures and team pictures and provide a link in the report.yaml file. Please make sure that each profile picture is only 100 x 100 px and your team photo is only 600 x 400 px. 

Here is a concrete example from last year.

```
company:
  name: Team Awesome (for BigCo, put the name of the host company in parentheses)
  logo: Cornell_NYC_Tech_logo.png
product_narrative: |
  Cornell Tech students build some amazing things. But it is often hard to show it to outside people.
  With BuildBoard, we let students provide regular updates about their work and create a Web version of it.
team:
  picture: E383E868-.jpg
  roster:
  - name: Rachel Sobel
    email: rachel.sobel.cornell@gmail.com
    picture: img/rachel.jpg
    program: LLM
  - name: Arnaud Sahuguet
    email: arnaud.sahuguet@cornell.edu
    picture: img/arnaud.png
    program: MBA
assets:
- title: Sprint 1
  url: https://tech.cornell.edu/
- title: Sprint 2
  url: https://tech.cornell.edu/jacobs-technion-cornell-institute/
```

## How will this information be used?
This information will be used to generate a website featuring all Bigco studio projects at http://buildboard-10044.cornelltech.io/bigco-studio-2020 (coming soon).

This website is public.

## How do I know if I did the right thing?
The output of our automated process writes to file buildboard.log in your team repository. We try to provide feedback when things went wrong, e.g. missing file, bad YAML syntax, etc.


