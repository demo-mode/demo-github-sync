import numpy as np
import seaborn as sn
import matplotlib.pyplot as plt
import pandas as pd
import matplotlib
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, MinMaxScaler

from sklearn.linear_model import LogisticRegression
from sklearn import model_selection
from sklearn.metrics import confusion_matrix, precision_score, recall_score, accuracy_score, f1_score