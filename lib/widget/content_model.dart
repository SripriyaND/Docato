class UnboardingContent{
  String image;
  String title;
  String description;
  UnboardingContent({required this.description, required this.image, required this.title});

}
List<UnboardingContent> contents=[
  UnboardingContent(
    description: 'Pick delicious food from our menu\nfor your fur babies', 
    image: "images/onboard1.png", 
    title: 'Your pet is Hungry??\nWanna give them treats? '),
   UnboardingContent(description: 'You can pay cash on delivery!!', 
   image: "images/onboard2.png", 
   title: 'Easy and online payment'),
   UnboardingContent(description: "Deliver food for your\nfurry companions at your door step", 
   image: "images/onboard3.png", 
   title: 'Quck Delivery at your door step')


];