from sklearn import datasets
import matplotlib.pyplot as plot

iris = datasets.load_iris()

plots = []
for comparative_feature in set(iris.feature_names):
    for feature_name in set(iris.feature_names):
        feature_index = iris.feature_names.index(feature_name)
        x = feature_index

        feature_data = iris.data[:, feature_index]

        y = iris.feature_names.index(comparative_feature)
        plot.subplot(len(iris.feature_names), len(iris.feature_names), x + 1 + y*len(iris.feature_names))
        if x == 0:
            plot.ylabel(comparative_feature)

        if y == len(iris.feature_names)-1:
            plot.xlabel(feature_name)

        if feature_name == comparative_feature:
            plot.hist(feature_data)
        else:
            comparative_feature_index = y
            comparative_feature_data = iris.data[:, comparative_feature_index]
            for target in set(iris.target):
                example_ids = target==iris.target
                xs = feature_data[example_ids]
                ys = comparative_feature_data[example_ids]
                plots.append(plot.scatter(xs, ys,
                    color='bgr'[target],
                    marker='o',
                    alpha=0.7))

plot.figlegend(plots[:4], set(iris.target_names), 'upper center', ncol=3)
plot.show()
