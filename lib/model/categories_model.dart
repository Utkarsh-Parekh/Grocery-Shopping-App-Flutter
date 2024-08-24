class Categories{
  final String imagePath;
  final String categoriesName;

  Categories({
    required this.imagePath,
    required this.categoriesName,
  });


}


final List<Categories> categoriesList = [
  Categories(imagePath: 'lib/assets/veggies.png', categoriesName: 'Fruits & Vegetables'),
  Categories(imagePath: 'lib/assets/dairy_items.png', categoriesName: 'Dairy Products'),
  Categories(imagePath: 'lib/assets/sweetsdeserts.png', categoriesName: 'Sweets & Deserts'),
  Categories(imagePath: 'lib/assets/cupcakes.jpg', categoriesName: 'Cakes'),
  Categories(imagePath: 'lib/assets/breakfast.png', categoriesName: 'BreakFast'),

];