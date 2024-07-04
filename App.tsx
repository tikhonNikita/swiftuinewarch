import React from 'react';
import {SafeAreaView, StyleSheet} from 'react-native';
import SuiViewViewNativeComponent from 'react-native-sui-view/src/SuiViewViewNativeComponent';

function App(): React.JSX.Element {
  return (
    <SafeAreaView style={styles.screenContainer}>
      <SuiViewViewNativeComponent
        onColorChange={event => {
          console.log(event.nativeEvent);
        }}
        color="green"
        style={{width: 100, height: 150}}
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  screenContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'lightblue',
  },
});

export default App;
