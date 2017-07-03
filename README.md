# CoreMLDemo
a xcode demo shows how to integrate a .mlmodel converted from .caffemodel into your app
# How to convert your caffemodel to mlmodel

```
$python
```

```python
>>> import coremltools

>>> model = coremltools.converters.caffe.convert(('./convert/squeezeNet_v1.1.caffemodel',
'./convert/deploy.prototxt',
'./convert/mean.binaryproto'),
image_input_names='data',is_bgr=True,class_labels = './convert/imagent1000-labels.txt' )

>>> model.save('squeezeNet.mlmodel')
```

# More
http://blog.csdn.net/may0324/article/details/74012336
