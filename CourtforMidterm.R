##### found at https://gist.github.com/edkupfer/6354964
### making a basketball court for the data with adjusted x-axis and y-axis to better fit the data of interest

# input: none
# output: returns a court ggplot object

courtplot <- function() {
  court <- ggplot(data = data.frame(x = 1, y = 1), aes(x = x * 10, y = y * 10+450)) +
  ###outside box:
  geom_path(data=data.frame(x=c(-25,-25,25,25,-25),y=c(-47,47,47,-47,-47)))+
  ###halfcourt line:
  geom_path(data=data.frame(x=c(-25,25),y=c(0,0)))+
  ###halfcourt semicircle:
  geom_path(data=data.frame(x=c(-6000:(-1)/1000,1:6000/1000),y=c(sqrt(6^2-c(-6000:(-1)/1000,1:6000/1000)^2))),aes(x=x*10,y=y*10+450))+
  geom_path(data=data.frame(x=c(-6000:(-1)/1000,1:6000/1000),y=-c(sqrt(6^2-c(-6000:(-1)/1000,1:6000/1000)^2))),aes(x=x*10,y=y*10+450))+
  ###solid FT semicircle above FT line:
  geom_path(data=data.frame(x=c(-6000:(-1)/1000,1:6000/1000),y=c(28-sqrt(6^2-c(-6000:(-1)/1000,1:6000/1000)^2))),aes(x=x*10,y=y*10+450))+
  geom_path(data=data.frame(x=c(-6000:(-1)/1000,1:6000/1000),y=-c(28-sqrt(6^2-c(-6000:(-1)/1000,1:6000/1000)^2))),aes(x=x*10,y=y*10+450))+
  ###dashed FT semicircle below FT line:
  geom_path(data=data.frame(x=c(-6000:(-1)/1000,1:6000/1000),y=c(28+sqrt(6^2-c(-6000:(-1)/1000,1:6000/1000)^2))),aes(x=x*10,y=y*10+450),linetype='dashed')+
  geom_path(data=data.frame(x=c(-6000:(-1)/1000,1:6000/1000),y=-c(28+sqrt(6^2-c(-6000:(-1)/1000,1:6000/1000)^2))),aes(x=x*10,y=y*10+450),linetype='dashed')+
  ###key:
  geom_path(data=data.frame(x=c(-8,-8,8,8,-8),y=c(47,28,28,47,47)))+
  geom_path(data=data.frame(x=-c(-8,-8,8,8,-8),y=-c(47,28,28,47,47)))+
  ###box inside the key:
  geom_path(data=data.frame(x=c(-6,-6,6,6,-6),y=c(47,28,28,47,47)))+
  geom_path(data=data.frame(x=c(-6,-6,6,6,-6),y=-c(47,28,28,47,47)))+
  ###restricted area semicircle:
  geom_path(data=data.frame(x=c(-4000:(-1)/1000,1:4000/1000),y=c(41.25-sqrt(4^2-c(-4000:(-1)/1000,1:4000/1000)^2))),aes(x=x*10,y=y*10+450))+
  geom_path(data=data.frame(x=c(-4000:(-1)/1000,1:4000/1000),y=-c(41.25-sqrt(4^2-c(-4000:(-1)/1000,1:4000/1000)^2))),aes(x=x*10,y=y*10+450))+
  ###rim:
  geom_path(data=data.frame(x=c(-750:(-1)/1000,1:750/1000,750:1/1000,-1:-750/1000),y=c(c(41.75+sqrt(0.75^2-c(-750:(-1)/1000,1:750/1000)^2)),c(41.75-sqrt(0.75^2-c(750:1/1000,-1:-750/1000)^2)))),aes(x=x*10,y=y*10+450))+
  geom_path(data=data.frame(x=c(-750:(-1)/1000,1:750/1000,750:1/1000,-1:-750/1000),y=-c(c(41.75+sqrt(0.75^2-c(-750:(-1)/1000,1:750/1000)^2)),c(41.75-sqrt(0.75^2-c(750:1/1000,-1:-750/1000)^2)))),aes(x=x*10,y=y*10+450))+
  ###backboard:
  geom_path(data=data.frame(x=c(-3,3),y=c(43,43)),lineend='butt')+
  geom_path(data=data.frame(x=c(-3,3),y=-c(43,43)),lineend='butt')+
  ###three-point line:
  geom_path(data=data.frame(x=c(-22,-22,-22000:(-1)/1000,1:22000/1000,22,22),y=c(47,47-169/12,41.75-sqrt(23.75^2-c(-22000:(-1)/1000,1:22000/1000)^2),47-169/12,47)),aes(x=x*10,y=y*10+418))+
  geom_path(data=data.frame(x=c(-22,-22,-22000:(-1)/1000,1:22000/1000,22,22),y=-c(47,47-169/12,41.75-sqrt(23.75^2-c(-22000:(-1)/1000,1:22000/1000)^2),47-169/12,47)),aes(x=x*10,y=y*10+418)) +
  ###fix aspect ratio to 1:1
  coord_fixed(ylim = c(0,500)) +
  # set axis labels to nothing
  labs(x = "", y = "")
  return (court)
}