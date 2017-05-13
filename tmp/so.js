/**
 * Created by michbil on 27.04.17.
 */
function test(req, res) {
    var
        user_id = req.params.user_id || req.body.user_id;
    var currency = req.params.user_id || req.body.currency;

    if (user_id == undefined || currency == undefined) {
        res.status(500).json({status: false, errors: "Empty parameters"});
    } else {
        isaccount().then(function (accountNumber) {
            if (accountNumber != null) {
                var timestamp = Date.now();
                var result = contract.createUser.sendTransaction(user_id, currency, accountNumber, timestamp, {
                    from: web3.eth.coinbase,
                    gas: 600000
                });
                function gotUser(error, result) {
                    if (!error) {
                        if (result.args.userId != undefined && result.args.accountId != undefined && result.args.categoryId != undefined) {
                            logger.info("user created with id :" + result);
                            res.status(200).json({
                                status: true,
                                data: {
                                    iduser: result.args.userId,
                                    accountId: result.args.accountId,
                                    created_at: timestamp
                                }
                            });
                        } else {
                            logger.info("user creation have problem :");
                            res.status(500).json({status: false, errors: "no response"});
                        }
                    } else {
                        logger.error(error);
                        res.status(500).send(false);
                    }
                }
                var event = contract.CreatedUser(gotUser);
            } else {
                logger.debug("Problem in accountNumber generation");
                res.status(500).send(false);
            }
        });
    }
}