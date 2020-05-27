import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/section.dart';
import '../providers/products.dart';

class FormOffer extends StatefulWidget {
  static String tag = 'form-offer-page';

  @override
  _FormOfferState createState() => _FormOfferState();
}

class _FormOfferState extends State<FormOffer> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: null,
    name: '',
    price: 0,
    desc: '',
    image: '',
  );
  var _initValues = {
    'name': '',
    'desc': '',
    'price': '',
    'image': '',
  };
  var _isInit = true;
  var _isLoading = false;

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  void initState() {
    // implement initState
    super.initState();
    _imageUrlFocusNode.addListener(_updateImageUrl);
    _priceFocusNode.addListener(_onOnFocusNodeEvent);
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as int;
      if (productId != null) {
        _editedProduct = Provider.of<Products>(context, listen: false)
            .findById(id: productId, type: true);
        _initValues = {
          'name': _editedProduct.name,
          'desc': _editedProduct.desc,
          'price': _editedProduct.price.toString(),
          'image': '',
        };
        _imageUrlController.text = _editedProduct.image;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    var offerSection =
        Section(type: 1, startDate: DateTime.now(), endDate: DateTime.now());
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedProduct.id != null) {
      await Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct, offerSection);
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct, offerSection);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred!'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
      // finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Form Penawaran"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: _form,
                    child: ListView(
                      children: <Widget>[
                        // TITLE FORM FIELD
                        TextFormField(
                          initialValue: _initValues['name'],
                          decoration: InputDecoration(
                            labelText: 'Title',
                            labelStyle: TextStyle(color: Colors.black54),
                          ),
                          cursorColor: Colors.black12,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_priceFocusNode);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please provide a value.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedProduct = Product(
                                name: value,
                                price: _editedProduct.price,
                                desc: _editedProduct.desc,
                                image: _editedProduct.image,
                                id: _editedProduct.id);
                          },
                        ),
                        // -- TITLE FORM FIELD
                        // PRICE FORM FIELD
                        TextFormField(
                          initialValue: _initValues['price'],
                          decoration: InputDecoration(
                            labelText: 'Price',
                            labelStyle: TextStyle(color: Colors.black54),
                          ),
                          cursorColor: Colors.black12,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          focusNode: _priceFocusNode,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_descriptionFocusNode);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a price.';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter a valid number.';
                            }
                            if (double.parse(value) <= 0) {
                              return 'Please enter a number greater than zero.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedProduct = Product(
                                name: _editedProduct.name,
                                price: int.parse(value),
                                desc: _editedProduct.desc,
                                image: _editedProduct.image,
                                id: _editedProduct.id);
                          },
                        ),
                        // -- PRICE FORM FIELD
                        // DESCRIPTION FORM FIELD
                        TextFormField(
                          initialValue: _initValues['desc'],
                          decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle: TextStyle(color: Colors.black54),
                          ),
                          cursorColor: Colors.black12,
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          focusNode: _descriptionFocusNode,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) {},
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a description.';
                            }
                            if (value.length < 10) {
                              return 'Should be at least 10 characters long.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedProduct = Product(
                                name: _editedProduct.name,
                                price: _editedProduct.price,
                                desc: value,
                                image: _editedProduct.image,
                                id: _editedProduct.id);
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 200,
                              height: 200,
                              margin: EdgeInsets.only(
                                top: 30,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: <Widget>[
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: _imageUrlController.text.isEmpty
                                        ? Container(
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                  top: 65,
                                                ),
                                                child: Icon(
                                                  Icons.photo_camera,
                                                  color: Colors.grey.withOpacity(0.5),
                                                  size: 50,
                                                ),
                                              ),
                                              Text(
                                            'Image URL',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          )
                                            ],
                                          ),
                                        )
                                        : FittedBox(
                                            child: Image.network(
                                              _imageUrlController.text,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Drop Image URL here',
                                  labelStyle: TextStyle(color: Colors.black54),
                                ),
                                cursorColor: Colors.black12,
                                keyboardType: TextInputType.url,
                                textInputAction: TextInputAction.done,
                                controller: _imageUrlController,
                                focusNode: _imageUrlFocusNode,
                                onFieldSubmitted: (_) {
                                  _saveForm();
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter an image URL.';
                                  }
                                  if (!value.startsWith('http') &&
                                      !value.startsWith('https')) {
                                    return 'Please enter a valid URL.';
                                  }
                                  if (!value.endsWith('.png') &&
                                      !value.endsWith('.jpg') &&
                                      !value.endsWith('.jpeg')) {
                                    return 'Please enter a valid image URL.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedProduct = Product(
                                      name: _editedProduct.name,
                                      price: _editedProduct.price,
                                      desc: _editedProduct.desc,
                                      image: value,
                                      id: _editedProduct.id);
                                },
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: RaisedButton(
                                child: Text(
                                  'Simpan',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Color.fromARGB(255, 255, 119, 0),
                                onPressed: _saveForm,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
