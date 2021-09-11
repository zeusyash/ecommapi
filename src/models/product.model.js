'use strict';
var dbConn = require('./../../config/db.config');
//Product object create
var Product = function (product) {
    this.name = product.name;
    this.category_name = product.category_name;
    this.description = product.description;
    this.buy_price = product.buy_price;
    this.sell_price = product.sell_price;
    this.quantity = product.quantity;
};

Product.create = function (newPro, result) {
    dbConn.query("INSERT INTO product set ?", newPro, function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(err, null);
        }
        else {
            console.log(res.insertId);
            result(null, res.insertId);
        }
    });
};

Product.findById = function (id, result) {
    dbConn.query("Select * from product where id = ? ", id, function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(err, null);
        }
        else {
            result(null, res);
        }
    });
};

Product.findAll = function (result) {
    dbConn.query("Select * from product", function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        }
        else {
            console.log('products : ', res);
            result(null, res);
        }
    });
};

Product.update = function (id, product, result) {
    dbConn.query("UPDATE product SET name=?,category_name=?,description=?,buy_price=?,sell_price=?,quantity=? WHERE id = ?", [product.name, product.category_name, product.description, product.buy_price, product.sell_price, product.quantity, id], function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};
Product.delete = function (id, result) {
    dbConn.query("DELETE FROM product WHERE id = ?", [id], function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        }
        else {
            result(null, res);
        }
    });
};
module.exports = Product;