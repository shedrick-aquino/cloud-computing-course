# Final Reflection – From Mission 1 to Mission 10
> *CCM101 – Cloud Computing | BSIT 4H*

## 1. Where We Started (Mission 1)
Before this course, we mostly just knew how to make basic web and mobile apps. We were used to writing code on normal computers where we could use a mouse to click on menus and folders. But we didn't really know how the computers that ran those apps actually worked behind the scenes. We had heard of "the cloud," but we had almost no real experience setting up Linux servers or keeping them safe.

At first, the hardest part was not having a normal screen. Opening our first Ubuntu server and seeing nothing but a black screen with text was a big shock. We couldn't just click around to open files or connect to the internet anymore. Things that used to take two clicks on a regular computer now required us to type out exact commands. It was scary at first because we had to learn to rely only on the keyboard, and we had to be very careful—typing just one wrong letter meant the command wouldn't work.

## 2. Skills We Built (Missions 2-9)

- **Mission 3 – Multi-Cloud Explorer:**
  - **Skill:** Acting as Cloud Solutions Consultants, we compared AWS, Microsoft Azure and Google Cloud and matched each client's needs to the right platform. We also investigated a real Linux server on KillerCoda using `cat /etc/os-release`, `lscpu`, `free -h` and `df -h`.
  - **Problem:** The three providers use different names for the same kinds of services (Amazon EC2, Azure Virtual Machines and Compute Engine are all virtual machines), which made them hard to compare. The full `lscpu` output was also long and hard to read.
  - **Solution:** We built a comparison table that lined up each provider's equivalent services, and we filtered the command output with `grep -E` to show only the lines we needed. This let us recommend a cloud VM sized for the server's 1 CPU, 1.9 GiB of RAM and 19 GB disk.

## 3. Putting It All Together (Mission 10) 
In Mission 10, everything we learned finally connected. We couldn't just build a server; we had to build it, protect it, and make it run on its own. We used our command line skills to create files, our container skills to launch the WordPress site, and our firewall skills to lock down the server. The skill we relied on the most was simply not panicking when using the black text screen. We had to type out long scripts and setup files, and being comfortable on the command line made that possible.

One big choice we made was to completely hide our database. Instead of giving the database its own public door to the internet, we put it on a secret, internal network. We did this for safety. Only our WordPress website is allowed to talk to the database. This means even if a bad actor finds our server, they cannot even see the database from the outside, let alone try to break into it.
 
The hardest bug we faced was a "database connection error" when we first tried to load our website. Our WordPress site was trying to turn on, but the database wasn't fully awake yet. We figured out how to fix this by adding a special rule in our setup file. We told the WordPress site to wait patiently and only start *after* the database sent a signal that it was 100% ready to work.

## 4. What "Production-Ready" Means to Us Now 
At the start of this class, we thought a project was finished as soon as the website loaded on our screen. Now we know that is just the beginning. "Production-ready" means the system is actually prepared for the real world. 

It needs **security** so bad actors can't easily break in or steal passwords. It needs **persistence**, meaning if the server crashes or restarts, all of our website posts and user data don't magically disappear. It also needs **automation**. Real servers have to run 24/7, so we set up a script to automatically back up our files every single night while we sleep, instead of having a human do it by hand.

The part we underestimated the most was **documentation**. Before, we just wanted to finish the setup and move on. But writing the Operational Manual for this mission made us realize a hard truth: if we don't write down exactly how to run, fix, and restore the server, the whole system is useless the moment someone else needs to take over. 

## 5. Looking Ahead
If we were building this for a real company, we would add a few more things to make it even better. First, we would add HTTPS so the website has a secure padlock icon in the browser. We would also set up a tool to watch the server and alert us immediately if something crashes. Finally, we would save our backups to a totally different location (like a separate cloud drive) instead of keeping them on the same computer, just in case the main server breaks completely. 

Building this project gave us a real taste of what it is like to work in IT. Whether we want to become software developers, network administrators, or cybersecurity analysts, knowing how to set up, protect, and fix a server makes us much more prepared for our future careers.
