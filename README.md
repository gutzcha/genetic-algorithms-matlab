# genetic-algorithms-matlab
A simple, yet fun, genetic algorithms in matlab in which a set of rockets are randomly sent out and must reach their target while avoiding obstacles

About the coder
disclaimer, I'm no where near profesional coder, it's jut a hobby, so if you want to see the general idea, be my geuss,
but if you want to learn how to code, beter ask someone that knows what he's takling about.
Oh, and I'm a realy bad speller.
I have had a lot of fun working on this little project, and here is the result of about 20 hours work,
I hope you enjoy it and benefit from it.

About the programe
Basicly, it's a basic genetic algorithm powered search enginge that trys to find a way from point A (0,0) to the target 
while avoiding obstacles (walls).
The way it does it, is by sending out N number of rockets with M number of moves. the move a set randomly (up, down, left,right).
after all the rockets are sent out, it gives each rocket's path a score reletive to it's distanse from the target.
The closer a rocket gets to it's target, the hight the score.
And then, it creats a pool of rocket pathes, the higher the score of the path, the more times it will show up in the pool.
Next, it randomly picks 2 pathes and jumbles them up to creat N new rockets based on the 2 "paretns", and off the go again.
Each time this process loops, the rockets are getting closer to the target, until they reach it (or don't).

Sometimes, they get stuck in a point from which they are unable to improve, that's why there's the mutation functio, 
whitch randomly adds "black sheeps" to the hurd of rockets so that maybe thay can find a better way instead of going up agains a wall.

Have fun and good luck
zic
