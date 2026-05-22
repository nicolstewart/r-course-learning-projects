myplot <- function(z, who=1:10) {
  matplot(t(z[who,,drop=F]), type="b", pch=15:18, col=c(1:4,6), main="Basketball Players Analysis")
  legend("bottomleft", inset=0.01, legend=Players[who], col=c(1:4,6), pch=15:18, horiz=F)
}

myplot(FreeThrows)
myplot(FreeThrowsAttempts)

#1. Free Throw Attempts / Games
myplot(FreeThrowsAttempts/Games)

#2. Free Throw Accuracy
myplot(FreeThrows/FreeThrowsAttempts)

#3. Player Style Patterns (excl. free throws)
myplot((Points - FreeThrows)/FieldGoals)
