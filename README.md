# CoreMLDemo
a xcode demo shows how to integrate a .mlmodel converted from .caffemodel into your app
# How to convert your caffemodel to mlmodel

>>> import coremltools
>>> model = coremltools.converters.caffe.convert(('/Users/xxx/cnn-project/coreml-model/squeezeNet/squeezeNet_v1.1.caffemodel',
'/Users/xxx/cnn-project/coreml-model/squeezeNet/deploy.prototxt',
'/Users/xxx/cnn-project/coreml-model/squeezeNet/mean.binaryproto'),
image_input_names='data',is_bgr=True,class_labels = '/Users/xxx/cnn-project/coreml-model/squeezeNet/imagent1000-labels.txt' )
>>> model.save('squeezeNet.mlmodel')


# More
http://blog.csdn.net/may0324/article/details/74012336
