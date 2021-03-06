import tf.TrainingOps;
import tf.StringOps;
import tf.StateOps;
import tf.SparseOps;
import tf.RandomOps;
import tf.ParsingOps;
import tf.NnOps;
import tf.MathOps;
import tf.LoggingOps;
import tf.LinalgOps;
import tf.IoOps;
import tf.ImageOps;
import tf.FunctionalOps;
import tf.ControlFlowOps;
import tf.CandidateSamplingOps;
// Not supported at the moment
//import tf.DataFlowOps;
//import tf.CtcOps;

import tf.ArrayOps;
import tf.ConstOps;
import tf.Tensor;
import tf.Const;
import tf.Session;
import tf.Output;
import tf.Type;

class Test
{
   #if cpp
   public static function __init__()
   {
      cpp.Lib.pushDllSearchPath( "../../ndll/" + cpp.Lib.getBinDirectory() );
   }
   #end

   public static function main()
   {
      // Basic constant operations
      // The value returned by the constructor represents the output
      // of the Constant op.
      var a = ArrayOps.placeholder(Float32);
      var product = MathOps.sum( a * Const.floats([1,2,3]), Const.ints([0]) );

      Session.with(function(sess) {
         var result = sess.runOutputs([product],[a],[7.0])[0];
         //var result = sess.run([product],[a => 6])[0];
         trace("The answer to life, the universe and everything is " + result);
      });

      /*
      var matrix1 = Const.floats([3., 3.],[1]);
      var matrix2 = Const.floats([2., 2.],[2]);
      var product = MathOps.multiply(matrix1, matrix2);

      Session.with( function(sess) {
         var result = sess.runOutput(product);
         //var result = sess.run([product],[a => 6])[0];
         trace("Matrix mult " + result);
      });
      matrix1 = tf.constant([[3., 3.]])
      matrix2 = tf.constant([[2.],[2.]])
      product = tf.matmul(matrix1, matrix2)
      with tf.Session() as sess:
          result = sess.run(product)
          print(result)
          // ==> [[ 12.]]
      */

   }
}
