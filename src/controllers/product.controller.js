'use strict';
const Product = require('../models/product.model');
exports.findAll = function (req, res) {
    Product.findAll(function (err, product) {
        console.log('controller')
        if (err)
            res.status(400).send({ status: "failure", "reason": err });
        console.log('res', product);
        res.status(200).send(product);
    });
};

exports.create = function (req, res) {
    const new_product = new Product(req.body);
    //handles null error
    if (req.body.constructor === Object && Object.keys(req.body).length === 0) {
        res.status(400).send({ status: "failure", reason: 'Please provide all required field' });
    } else {
        if (new_product.quantity < 0) {
            res.status(416).send({ status: "failure", reason: "quantity must non negative number" });
        }
        else {
            if (!new_product.name || !new_product.category_name || !new_product.buy_price || !new_product.sell_price || !new_product.quantity) {
                res.status(400).send({ status: "failure", reason: "Data Missing" });
            }
            else {
                Product.create(new_product, function (err, product) {
                    if (err) {
                        res.status(400).send({ status: "failure", reason: err });
                    }
                    else {
                        res.status(201).json({ error: false, message: "Product added successfully!", id: product });
                    }
                });
            }

        }

    }
};


exports.findById = function (req, res) {
    Product.findById(req.params.id, function (err, product) {
        if (err)
            res.status(400).send({ status: "failure", reason: err });

        if (product.length == 0) {
            res.status(404).send({});
        }
        else {
            res.status(200).json(product);
        }
    });
};

exports.update = function (req, res) {
    if (req.body.constructor === Object && Object.keys(req.body).length === 0) {
        res.status(400).send({ status: "failure", reason: 'Please provide all required field' });
    } else {
        if (!req.body.name || !req.body.category_name || !req.body.buy_price || !req.body.sell_price || !req.body.quantity) {
            res.status(400).send({ status: "failure", reason: "Data Missing" });
        }
        else {
            Product.update(req.params.id, new Product(req.body), function (err, product) {
                if (err) {
                    res.status(400).send({ status: "failure", reason: err });
                }
                else {
                    res.status(200).json({ status: "success" });
                }


            });
        }
    }
};

exports.delete = function (req, res) {
    Product.delete(req.params.id, function (err, product) {
        if (err)
            res.status(400).send({ status: "failure", reason: err });
        res.status(204).json({ status: "success" });
    });
};