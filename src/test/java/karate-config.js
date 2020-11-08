function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
	baseUrl : 'https://trendyol.com'
  }
  if (env == 'dev') {

//    config.baseUrl = 'dev.trendyol.com';
//    config.token = 'dev123465';

  } else if (env == 'qa') {

//    config.baseUrl = 'qa.trendyol.com';
//    config.token = 'qa123456';

  }
  return config;
}