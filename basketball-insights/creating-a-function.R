#creating a function
#add parameters to not keep editing in function
#rows became a variable

myplot <- function(rows){
  Data <- MinutesPlayed[rows,, drop=F]
  matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

#here now user gives function the variable of which rows to use for Players
myplot(1:10)

#want to use the function to visualize other data - make it flexible:
#rows=1:10 is the default if user doesnt add rows themselves 
myplot <- function(data, rows=1:10){
  Data <- data[rows,, drop=F]
  matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

myplot(MinutesPlayed/Games, 3)
