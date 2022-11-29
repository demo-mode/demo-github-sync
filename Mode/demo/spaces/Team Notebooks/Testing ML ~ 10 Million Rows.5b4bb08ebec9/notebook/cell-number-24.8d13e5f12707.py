# Loop through your namespace and get the size of all of the objects

for (itm in ls()) { 
    print(formatC(c(itm, object.size(get(itm))), 
        format="d", 
        big.mark=",", 
        width=30), 
        quote=F)
}