# Import libraries
from wordcloud import WordCloud
import matplotlib.pyplot as plt

# Put query output in a dataframe 
df = datasets["Product Review Word Cloud"]

# Create the wordcloud object
wordcloud = WordCloud(width=1000, height=600, margin=0,relative_scaling =1, stopwords=["control", "dtype","ordered","levers","suspension","brake","frame","fall"],colormap="Blues",background_color="black").generate(str(df['keyword']))

# Display the generated image
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis("off")
plt.margins(x=0, y=0)
plt.show()