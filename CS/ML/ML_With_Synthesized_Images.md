https://machinelearning.apple.com/2017/07/07/GAN.html

- Post describes how ML models are trained with synthesized images in order to avoid the need of collecting large amounts of labelled data

  - Good, labelled data for supervised learning still seems to be one of the main issues

- ML is also used to generate the synthesized images itself

- > If so, we could just generate a bunch of synthetic images, capture real images of eyes, and without labeling any real images at all, learn this mapping—making the method cheap and easy to apply in practice.
  >
  > ​
  >
  > To learn our refiner network in an unsupervised manner, we utilize an auxiliary discriminator network that classifies the real and the refined (or fake) images into two classes. The refiner network tries to fool this discriminator network into thinking the refined images are the real ones. Both the networks train alternately, and training stops when the discriminator cannot distinguish the real images from the fake ones. 

