import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type {ViewProps} from 'react-native';
import {DirectEventHandler} from 'react-native/Libraries/Types/CodegenTypes';

type Event = Readonly<{
  value: string;
}>;

interface NativeProps extends ViewProps {
  color?: string;
  onColorChange?: DirectEventHandler<Event>;
}

export default codegenNativeComponent<NativeProps>('SuiViewView');
