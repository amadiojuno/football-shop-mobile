import 'package:flutter/material.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya
import 'package:football_shop/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
    const ProductFormPage({super.key});

    @override
    State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    String _brand = "";
    String _price = "";
    String _description = "";
    int _rating = 0;
    String _thumbnail = "";
    String _category = "shoes"; // default
    bool _isFeatured = false; // default

    final List<String> _categories = [
      'shoes',
      'clothes',
      'equipment',
      'accessories',
      'misc',
    ];
    
    @override
    Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
        return Scaffold(
                appBar: AppBar(
                  title: const Center(
                    child: Text(
                      'Form Tambah Produk',
                    ),
                  ),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                // TODO: Tambahkan drawer yang sudah dibuat di sini
                drawer: const LeftDrawer(),
                body: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                // === Name ===
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Nama Produk",
                                      labelText: "Nama Produk",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        _name = value!;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Nama produk tidak boleh kosong!";
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                // === Brand ===
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Merek Produk",
                                      labelText: "Merek Produk",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        _brand = value!;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Merek produk tidak boleh kosong!";
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                // === Price ===
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Harga Produk",
                                      labelText: "Harga Produk",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _price = value!;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Harga produk tidak boleh kosong!";
                                      }
                                      if (double.tryParse(value) == null) {
                                        return "Harga produk harus berupa angka!";
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                // === Description ===
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText: "Deskripsi Produk",
                                      labelText: "Deskripsi Produk",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        _description = value!;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Deskripsi produk tidak boleh kosong!";
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                // === Rating ===
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Rating Produk (0-5)",
                                      labelText: "Rating Produk",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _rating = int.tryParse(value!) ?? 0;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Rating produk tidak boleh kosong!";
                                      }
                                      int? rating = int.tryParse(value);
                                      if (rating == null || rating < 0 || rating > 5) {
                                        return "Rating produk harus berupa angka antara 0 hingga 5!";
                                      }
                                      return null;
                                    },
                                  ),
                                ),


                                // === Category ===
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      labelText: "Kategori",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    value: _category,
                                    items: _categories
                                        .map((cat) => DropdownMenuItem(
                                              value: cat,
                                              child: Text(
                                                  cat[0].toUpperCase() + cat.substring(1)),
                                            ))
                                        .toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _category = newValue!;
                                      });
                                    },
                                  ),
                                ),

                                // === Thumbnail URL ===
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "URL Thumbnail (opsional)",
                                      labelText: "URL Thumbnail",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        _thumbnail = value!;
                                      });
                                    },
                                  ),
                                ),

                                // === Is Featured ===
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SwitchListTile(
                                    title: const Text("Tandai sebagai Produk Unggulan"),
                                    value: _isFeatured,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _isFeatured = value;
                                      });
                                    },
                                  ),
                                ),
                                // === Tombol Simpan ===
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(Colors.indigo),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          // TODO: Replace the URL with your app's URL
                                          // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                                          // If you using chrome,  use URL http://localhost:8000
                                          
                                          final response = await request.postJson(
                                            "http://localhost:8000/add-product-flutter/",
                                            jsonEncode({
                                              "name": _name,
                                              "brand": _brand,
                                              "price": double.parse(_price),
                                              "description": _description,
                                              "rating": _rating,
                                              "thumbnail": _thumbnail,
                                              "category": _category,
                                              "is_featured": _isFeatured,
                                            }),
                                          );
                                          if (context.mounted) {
                                            if (response['status'] == 'success') {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text("Product successfully saved!"),
                                              ));
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => MyHomePage()),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text("Something went wrong, please try again."),
                                              ));
                                            }
                                          }
                                        }
                                      },
                                      child: const Text(
                                        "Save",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }