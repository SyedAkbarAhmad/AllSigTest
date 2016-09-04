
#' Univariate & Bivariate analysis of dataset
#'
#' This function loads a data frame, provides univariate distribution of each variable
#' and performs significance tests on a target variable with all other variables. 
#' The tests are correlation, chi-square and ANOVA depending no the type of varible.
#'
#' @param Input data frame 
#' @return charts

#' @export

AllSigTest <-  function(Data, Targetx) {
  

  
  Target <- as.data.frame(Data[Targetx])
  
  names(Target) <- Targetx
   
  
  # Univariate Distribution
  
  
  plot(c(0, 1), c(0, 1), ann = F, bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n')
  print(text(x = 0.5, y = 0.5, paste("Univariate DIstribution of Variables"), 
        col = "black"))
  
  for (i in 1:ncol(Data))
  
  {
    if (class(Data[,i]) == 'numeric' | class(Data[,i]) == 'integer')
    {
      print(hist(Data[,i],breaks = 100,main = paste("Histogram of",colnames(Data[i])),	xlab=colnames(Data[i]),col="darkblue"))
          
    }
    
    if (class(Data[,i]) == 'factor' | class(Data[,i]) == 'character')
    {
      counts <- table(Data[,i])
      print(barplot(counts,	xlab=names(Data[i]),main = paste("Bar Plot of",colnames(Data[i])),col=rainbow(10)))
    }
  }
 
  
  # Correlation plot
  
  Data.Cor.DF <- Data[,sapply(Data,is.numeric)] 
  
  
  numcol <- length(as.data.frame(Data.Cor.DF))
  
  if (numcol >1)
  {
  
  Data.Cor <-cor(Data.Cor.DF, use="complete")
  
   col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
  print(corrplot::corrplot(Data.Cor, method="color", col=col(200),  
           type="upper", order="hclust", 
           addCoef.col = "black", # Add coefficient of correlation
           tl.col="black", tl.srt=45, #Text label color and rotation
           # Combine with significance
           sig.level = 0.01, insig = "blank", 
           # hide correlation coefficient on the principal diagonal
           diag=FALSE , main = "Correlation Plot"
  ))
  
  }
  # Dependent vs Independent analysis
  
  plot(c(0, 1), c(0, 1), ann = F, bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n')
  print(text(x = 0.5, y = 0.5, paste("Bivariate Analysis of Variables"), 
             col = "black"))
  

  Data[Targetx] <- NULL
  
  # numeric target: correlation & anova
  
  if(class(Target[,1]) == 'numeric' | class(Target[,1]) == 'integer')
  {
    
    for (i in 1:ncol(Data))
    { 
      if (class(Data[,i]) == 'numeric' | class(Data[,i]) == 'integer')
      { 
        
        
        cor1 = cor(Data[,i],Target[,1],use="complete") 
        
      

        print(plot(Data[,i],Target[,1],	xlab=names(Data[i]), ylab=names(Target),col="darkblue", main = paste("The correlation between", names(Data[i]), " and ", names(Target) ," is ",cor1)))
        print(abline(lm(Target[,1] ~ Data[,i])))
        
      }  
      
      if (class(Data[,i]) == 'factor')
      { 
        
        a = aov(Target[,1] ~ Data[,i])
        
        b <- summary(a)
        
        c <- b[[1]][[5]][[1]]
        
        
        
        print(gplots::plotmeans(Target[,1] ~ Data[,i]  ,xlab=names(Data[i]),
                  ylab=names(Target), main=paste("P value for anova between", names(Data[i]), " and ", names(Target) , " is ",c)))
        
        
        
      } 
      
    }
    
  }
  
  # End correlation
  
    

  
  # Chi Sq test
  
  
  
  if(class(Target[,1]) == 'factor')
  {
    
    for (i in 1:ncol(Data))
    { if (class(Data[,i]) == 'factor')
    { 
      
      
      tbl = table(Data[,i],Target[,1]) 
      
      csq <-chisq.test(tbl) 
      
      c <- csq[[3]]
      
      title <- paste("P value for chi square between", names(Data[i]), " and ", names(Target), " is ",c)
      print(mosaicplot(tbl, color=TRUE, main=title ,ylab = names(Target), xlab = names(Data[i])))      
      
    }
      
      if (class(Data[,i]) == 'numeric' | class(Data[,i]) == 'integer')
      { 
        
        a = aov(Data[,i]~Target[,1] )
        
        b <- summary(a)
        
        c <- b[[1]][[5]][[1]]
        
        title <- print(paste("P value for anova between", names(Data[i]), " and ", names(Target) , " is ",c))
        
        print(gplots::plotmeans(Data[,i]~Target[,1]  ,ylab=names(Data[i]),
                  xlab=names(Target), main = title))
        
        
        
      }  
      
    }
    
  }
  
  
  # End of chi sq test

}
