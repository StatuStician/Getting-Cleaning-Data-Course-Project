run_analysis <-function(){
        
        
        
        #Load relevant data, label, and subject files 
        x_train<-read.table("./X_train.txt")
        x_test<-read.table("./X_test.txt")
        y_train<-read.table("./Y_train.txt")
        y_test<-read.table("./Y_test.txt")
        subject_test<-read.table("subject_test.txt")
        subject_train<-read.table("subject_train.txt")
        
        ##########
        # STEP 1 #
        ########## Merge test-train file pairs into one object
        X<-rbind(x_train,x_test)
        Y<-rbind(y_train,y_test)
        subject<-rbind(subject_test,subject_train)
        
        ###########
        # STEP 2 #
        ########## Extract mean and STDEV measurements
        features<-read.table("features.txt")
        
        #features with 'mean' or 'std' in their name are the ones we want
        #We can retrieve this with the grep function and look for it within the names of the features
        #Relevant Features
        rel_features<-grep("-(mean|std)\\(\\)",features[,2])
        
        #modify 'X' to drop undesired columns
        X<-X[,rel_features]
        
        #project feature variable names onto the column names of the data
        names(X)<-features[rel_features,2]
        
        ##########
        # STEP 3 #
        ##########
        #We want to replace numerical activity indices with the descriptive name
        
        desc<-read.table("activity_labels.txt")
        
        #Indices of 'Y' are now the descriptive labels that correspond to the indices of 'Y'
        Y[,1]<-desc[Y[,1],2]
        
        #A more descriptive column name
        names(Y)<-"Descriptive_Activity"
        
        ##########
        # STEP 4 #
        ##########
        # Rename 'subject' object and merge all the data
        names(subject)<-"subject"
        
        all<-cbind(X,Y,subject)
        
        ##########
        # STEP 5 #
        ##########
        # Copy existing data set but make it tidy and deliver means of each variable
        
        averageAll<-colMeans(all[,1:66])
        write.table(averageAll,"averageData.txt",row.names=FALSE)
        
}